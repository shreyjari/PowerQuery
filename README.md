# PowerQuery

fx_CleanText = (text as nullable text) as nullable text =>
let
    // Handle null values safely
    InputText = if text = null then "" else text,
    
    // Trim spaces and remove non-printable characters
    Trimmed = Text.Trim(InputText),  
    NonPrintableRemoved = Text.Clean(Trimmed),  
    
    // Define Unicode character sets for valid name characters
    AllowedCharacters = List.Combine({
        {"A".."Z", "a".."z", " ", "-", "'"},  // Latin characters & separators
        {"À".."ÿ"},  // Latin Extended (Accents, Umlauts, etc.)
        {"Ѐ".."ӿ"},  // Cyrillic (Russian, Ukrainian, Serbian, etc.)
        {"Α".."Ω", "α".."ω"},  // Greek
        {"א".."ת"},  // Hebrew
        {"ء".."ي", "ـ"},  // Arabic
        {"Ա".."Ֆ"},  // Armenian
        {"Ꭰ".."Ᏼ"},  // Cherokee
        {"一".."龥"},  // Chinese characters (CJK)
        {"ぁ".."ゟ", "゠".."ヿ"},  // Japanese Hiragana & Katakana
        {"가".."힣"},  // Korean Hangul
        List.Transform({2304..2431}, Character.FromNumber),  // Hindi, Sanskrit, Devanagari script
        List.Transform({3585..3675}, Character.FromNumber),  // Thai
        List.Transform({12448..12543}, Character.FromNumber),  // Japanese Katakana
        List.Transform({19968..40959}, Character.FromNumber)  // Chinese, Japanese, Korean (CJK)
    }),

    // Keep only valid characters
    Cleaned = Text.Select(NonPrintableRemoved, AllowedCharacters),  
    
    // Convert to Proper Case for readability
    ProperCased = Text.Proper(Cleaned)  
in
    ProperCased
