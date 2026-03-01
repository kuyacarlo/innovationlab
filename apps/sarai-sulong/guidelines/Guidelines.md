Since you are a Computer Engineering student at BulSU and this project involves a mix of hardware (GSM/USSD) and software (React/FastAPI), your `guidelines.md` needs to ensure that everyone on the team—from the frontend devs to the systems architects—is on the same page.

Here is a comprehensive `guidelines.md` template tailored for **Project SARAI-SABI**.

---

# 🌾 Project SARAI-SABI | Development Guidelines

## 1. Project Vision

**SARAI-SABI** bridges the digital divide by connecting high-tech agricultural data (Project SARAI) to low-tech delivery methods (USSD/Voice) and urban consumer markets (Sulong Web Portal).

---

## 2. Design & Branding (Sulong Portal)

To maintain the **Professional & Sleek** "vibe" we established:

- **Typography:** Primary font is **Inter**. Use `font-feature-settings: 'cv11'` for maximum legibility.
- **Color Palette:**
- `Primary-Dark`: `#1A3D2E` (Deep Forest Green) - Used for Sidebar and Headers.
- `Accent-Orange`: `#F59E0B` (Amber) - Used for Action Buttons (Subscribe/Report).
- `Background`: `#FDFBF7` (Off-white/Cream) - To keep it looking "organic."

- **Components:** \* Use **12px border-radius** on all cards and inputs.
- Maintain a minimum **16px padding** within all containers to prevent visual clutter.
- All "Sulong" branding must be rendered as **text** (not images) using a semi-bold weight for SEO and accessibility.

---

## 3. Technical Standards

### **Backend (FastAPI / Python)**

- **API Design:** Follow RESTful principles. All endpoints must return JSON.
- **Documentation:** Every endpoint must be documented via Swagger (`/docs`).
- **Integration:** The "Cloud-to-GSM" bridge must have a 5-second timeout fail-safe to prevent hanging USSD sessions.

### **Frontend (React / Tailwind)**

- **Component Structure:** Follow the Atomic Design pattern (Atoms, Molecules, Organisms).
- **State Management:** Use `Zustand` or `React Context` for global state (e.g., User Subscription data).
- **Responsiveness:** Use a **Mobile-First** approach. Ensure the dashboard is usable on tablets and phones, even though it's a "Web Portal."

### **Telephony (USSD & Voice)**

- **Latency:** USSD menus must respond within **2 seconds** to prevent network timeouts.
- **Language:** All farmer-facing strings must be localized. Default is Tagalog; support for Ilokano/Hiligaynon must be toggleable in the DB.

---

## 4. Git Flow & Collaboration

- **Branching:** \* `main`: Production-ready code.
- `dev`: Integration branch for features.
- `feature/feature-name`: Individual task branches.

- **Commits:** Use [Conventional Commits](https://www.conventionalcommits.org/) (e.g., `feat: add USSD harvest logging`, `fix: sidebar alignment`).
- **PR Reviews:** At least one peer review is required before merging into `dev`.

---

## 5. Security & Data Integrity (Tanggol-Saka)

- **Immutability:** Log entries for land occupancy must be timestamped and signed. Once written to the DB, they cannot be edited.
- **Privacy:** Farmer contact numbers must be encrypted at rest. Do not log PII (Personally Identifiable Information) in console logs.

---

## 6. Definition of Done (DoD)

A task is "Done" when:

1. [ ] Code is linted and formatted.
2. [ ] Responsive design is verified (Desktop & Mobile).
3. [ ] API endpoints are tested via Postman/Thunder Client.
4. [ ] UI matches the "Sulong" professional aesthetic.

<!--

System Guidelines

Use this file to provide the AI with rules and guidelines you want it to follow.
This template outlines a few examples of things you can add. You can add your own sections and format it to suit your needs

TIP: More context isn't always better. It can confuse the LLM. Try and add the most important rules you need

# General guidelines

Any general rules you want the AI to follow.
For example:

* Only use absolute positioning when necessary. Opt for responsive and well structured layouts that use flexbox and grid by default
* Refactor code as you go to keep code clean
* Keep file sizes small and put helper functions and components in their own files.

--------------

# Design system guidelines
Rules for how the AI should make generations look like your company's design system

Additionally, if you select a design system to use in the prompt box, you can reference
your design system's components, tokens, variables and components.
For example:

* Use a base font-size of 14px
* Date formats should always be in the format “Jun 10”
* The bottom toolbar should only ever have a maximum of 4 items
* Never use the floating action button with the bottom toolbar
* Chips should always come in sets of 3 or more
* Don't use a dropdown if there are 2 or fewer options

You can also create sub sections and add more specific details
For example:


## Button
The Button component is a fundamental interactive element in our design system, designed to trigger actions or navigate
users through the application. It provides visual feedback and clear affordances to enhance user experience.

### Usage
Buttons should be used for important actions that users need to take, such as form submissions, confirming choices,
or initiating processes. They communicate interactivity and should have clear, action-oriented labels.

### Variants
* Primary Button
  * Purpose : Used for the main action in a section or page
  * Visual Style : Bold, filled with the primary brand color
  * Usage : One primary button per section to guide users toward the most important action
* Secondary Button
  * Purpose : Used for alternative or supporting actions
  * Visual Style : Outlined with the primary color, transparent background
  * Usage : Can appear alongside a primary button for less important actions
* Tertiary Button
  * Purpose : Used for the least important actions
  * Visual Style : Text-only with no border, using primary color
  * Usage : For actions that should be available but not emphasized
-->