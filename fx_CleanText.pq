// fx_CleanText - Global Name Cleaner for Power Query
// --------------------------------------------------
// Module 1: Null handling – ensures input safety
// Module 2: Basic cleanup – trims whitespace, removes control characters
// Module 3: Character allowlist – retains multilingual name-friendly characters
// Module 4: Character filtering – removes numbers, symbols, and unsupported characters
// Module 5: Name casing – converts to readable Proper Case (handles names like O’Connor, Jean-Luc)

fx_CleanText = (text as nullable text) as nullable text =>
let
    // Module 1: Replace null with empty string to avoid transformation errors
    InputText = if text = null then "" else text,

    // Module 2: Remove leading/trailing spaces and non-printable characters
    Trimmed = Text.Trim(InputText),
    CleanedText = Text.Clean(Trimmed),

    // Module 3: Allowlist of valid name characters including global scripts and separators
    Allowed = List.Combine({
        {"A".."Z", "a".."z", " ", "-", "'"},                    // Basic Latin + separators
        {"À".."ÿ"},                                             // Latin extended (accents)
        {"Ѐ".."ӿ"}, {"Α".."Ω", "α".."ω"},                      // Cyrillic, Greek
        {"א".."ת"}, {"ء".."ي", "ـ"},                            // Hebrew, Arabic
        {"Ա".."Ֆ"}, {"Ꭰ".."Ᏼ"},                                // Armenian, Cherokee
        {"一".."龥"}, {"ぁ".."ゟ", "゠".."ヿ"}, {"가".."힣"},      // Chinese, Japanese, Korean (CJK)
        List.Transform({2304..2431}, Character.FromNumber),    // Devanagari (Hindi, Sanskrit)
        List.Transform({3585..3675}, Character.FromNumber),    // Thai
        List.Transform({12448..12543}, Character.FromNumber),  // Japanese Katakana Extended
        List.Transform({19968..40959}, Character.FromNumber)   // Unified CJK block
    }),

    // Module 4: Strip all characters not in the allowlist (e.g. digits, symbols)
    Selected = Text.Select(CleanedText, Allowed),

    // Module 5: Format cleaned string in Proper Case for display
    Result = Text.Proper(Selected)
in
    Result
