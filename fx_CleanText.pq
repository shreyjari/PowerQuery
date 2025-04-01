// fx_CleanText - Scalable Global Name Cleaner
// -------------------------------------------
// Module 1: Handle nulls safely
// Module 2: Trim and clean basic formatting
// Module 3: Whitelist multilingual name characters
// Module 4: Remove unwanted characters
// Module 5: Apply smart proper casing

fx_CleanText = (text as nullable text) as nullable text =>
let
    // Module 1: Null-safe input
    InputText = if text = null then "" else text,

    // Module 2: Trim and remove non-printables
    Trimmed = Text.Trim(InputText),
    CleanedText = Text.Clean(Trimmed),

    // Module 3: Unicode character whitelist
    Allowed = List.Combine({
        {"A".."Z", "a".."z", " ", "-", "'"},
        {"À".."ÿ"}, {"Ѐ".."ӿ"}, {"Α".."Ω", "α".."ω"}, {"א".."ת"}, {"ء".."ي", "ـ"},
        {"Ա".."Ֆ"}, {"Ꭰ".."Ᏼ"}, {"一".."龥"}, {"ぁ".."ゟ", "゠".."ヿ"}, {"가".."힣"},
        List.Transform({2304..2431}, Character.FromNumber),
        List.Transform({3585..3675}, Character.FromNumber),
        List.Transform({12448..12543}, Character.FromNumber),
        List.Transform({19968..40959}, Character.FromNumber)
    }),

    // Module 4: Filter valid characters
    Selected = Text.Select(CleanedText, Allowed),

    // Module 5: Proper case conversion
    Result = Text.Proper(Selected)
in
    Result
