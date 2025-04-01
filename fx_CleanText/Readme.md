---

## 🧩 1. Comments (for the function code)
```m
// Replace nulls with empty string to ensure input is safe for processing
// Trim surrounding spaces and remove non-printable/control characters
// Create a list of valid characters from global name scripts and basic separators
// Keep only the valid characters, removing digits and special symbols
// Convert cleaned text to Proper Case (e.g., 'jean-luc' → 'Jean-Luc')
```

---

## 🧠 2. User-Friendly Understanding of the Logic

Think of `fx_CleanText` as a **global name sanitizer** built from 5 mini blocks (modules), each doing one specific job:

### 🧱 Module 1: **Safe Start**
- If the input is null, replace it with an empty string.
- Prevents the function from breaking due to missing values.

### 🧱 Module 2: **Basic Cleanup**
- Removes extra spaces and non-printable characters (like tabs or line breaks).
- Think of this like wiping dust off before deeper cleaning.

### 🧱 Module 3: **Allowed Character Set**
- Builds a list of characters you'd typically see in real names—Latin, Arabic, Chinese, Cyrillic, etc.
- This ensures you retain useful global characters but strip out noise.

### 🧱 Module 4: **Filter Out Junk**
- Filters the input so only allowed characters remain.
- Removes numbers, emojis, punctuation, and symbols you don’t want in names.

### 🧱 Module 5: **Smart Casing**
- Applies `Proper Case` so names look professional and readable.
- Handles things like `"jean-luc"` → `"Jean-Luc"` or `"o’connor"` → `"O’Connor"`.

---

## 🛠️ 3. How to Use It (LEGO-Modular Style)

### 🧩 Step 1: Add the Function Block

**Add the `fx_CleanText` function once** to your Power Query project:
- This is like building a custom LEGO brick you’ll reuse.
- Copy the full code into a blank query → name it `fx_CleanText`.

### 🧩 Step 2: Attach It to Any Name Field

**Plug the function into any name column**:
- Either create a new column:
  ```m
  fx_CleanText([Name])
  ```
- Or transform the existing one in-place:
  ```m
  Table.TransformColumns(Source, {{"Name", fx_CleanText, type text}})
  ```

### 🧩 Step 3: Reuse Anywhere

**You can reuse `fx_CleanText` in any table**:
- It behaves like a reusable LEGO brick: drop it onto any name column in any dataset.

---

## 🔁 Optional Extensions (Extra LEGO Pieces)

- Want to **remove suffixes**? Add a suffix-cleaning module.
- Want to **track cleaning stats**? Add a step to log before/after values.
- Want **custom casing logic** for edge cases like "McDonald"? You can plug in smarter casing logic later.

---
