Generate a Product Requirements Document (PRD) with an interactive interview.

Usage: /prd/init [template-file]

Arguments: $ARGUMENTS

## 🎯 PRD Generation Interview

I'll help you create a Product Requirements Document by asking you key questions about your product vision.
This PRD will be compatible with Task Master's parse-prd command.

<template-check>
$TEMPLATE_PATH = $ARGUMENTS ? $ARGUMENTS : null
</template-check>

---

## 🚀 Let's Build Your Product Vision!

I'll guide you through creating a comprehensive PRD with a series of strategic questions.

---

## 📍 Step 1: Core Problem

### 🔍 **What specific problem are you solving?**

> 💡 *Tip: Describe the pain point or challenge your product addresses. Be specific about who feels this pain and why it matters.*

<wait-for-response:problem>

---

## 💡 Step 2: Product Solution  

### 🎯 **What's your product? (name + one-line description)**

> 💡 *Example: "Nuance - On-device AI translation that understands context like a native speaker"*

<wait-for-response:solution>

---

## 👥 Step 3: Target User

### 🎪 **Who desperately needs this?**

> 💡 *Be specific: job titles, demographics, behaviors, or situations where they need your solution*

<wait-for-response:user>

---

## 🎯 Step 4: Goals Framework

### 📈 Business Goal

**What business outcome do you want?**

> 💡 *Consider: revenue targets, user growth, market share, or strategic partnerships*

<wait-for-response:business_goal>

### 🌟 User Goal  

**What does the user want to achieve?**

> 💡 *Their success state - what will make them love your product?*

<wait-for-response:user_goal>

### 🚫 Non-Goals

**What are you explicitly NOT doing?**

> 💡 *Constraints help maintain focus - what's outside your scope?*

<wait-for-response:non_goals>

---

## 🛠️ Step 5: MVP Features

### ⭐ **List 3-5 must-have features for launch:**

> 💡 *Focus on the absolute essentials that deliver your core value*

<wait-for-response:mvp_features>

---

## 📋 Step 6: Technical & Implementation Details

<template-questions>
Based on the template, let me ask about key implementation areas:

### 🏗️ **Technical Architecture**
- What's your tech stack?
- Any specific frameworks or APIs?
- Platform requirements?

### 👤 **Development Approach**
- Solo or team?
- Timeline expectations?
- Existing code to leverage?

### ⚠️ **Key Challenges**
- Technical risks?
- Resource constraints?
- Performance requirements?

> 💡 *Answer what you know, or type "skip" for any section*

<wait-for-response:template_questions>
</template-questions>

---

## ✅ Summary Review

### 📊 **Your Product Blueprint:**

```
🔍 Problem:       {problem}
💡 Solution:      {solution}  
👥 Target User:   {user}
📈 Business Goal: {business_goal}
🌟 User Goal:     {user_goal}
🚫 Non-Goals:     {non_goals}
⭐ MVP Features:  {mvp_features}
🏗️ Tech Details:  {template_questions}
```

### **Ready to proceed?** 
- ✅ Type **"yes"** to generate PRD
- ➕ Type **"add"** to include more details
- 🔄 Type **"revise"** to modify any section

<handle-choice:continue_choice>

<if-add>
## ➕ Additional Details (Optional)

### Quick additions:

1. 🔧 **Tech stack specifics**
2. 🚀 **Future features roadmap**
3. ⏰ **Timeline & milestones**  
4. 🔗 **Integrations & APIs**
5. 💰 **Budget & resources**
6. 📊 **Success metrics**

Enter numbers (e.g., "1,3,5") or type **'skip'**:

<wait-for-optional:additions>
</if-add>

---

## 📄 Generated PRD

```markdown
# Product Requirements Document

## Product Definition

**Product:** {solution}
**Problem:** {problem}
**Target User:** {user}

## Goals

### Business Goals
{business_goal}

### User Goals
{user_goal}

### Non-Goals
{non_goals}

## MVP Scope

### Core Features
{mvp_features}

### Success Criteria
- Business goal achievement: {business_goal}
- User goal achievement: {user_goal}

## Technical Architecture
{technical_details}

## Implementation Plan

### Phase 1: MVP
Build core features to validate problem-solution fit

### Phase 2: Iterate
Refine based on user feedback toward goals

### Phase 3: Scale
Expand when goals are consistently met

## Development Approach
{development_approach}

## Risks and Challenges
{challenges}

{additional_sections}

---
*🤖 Task Master compatible - run: `task-master parse-prd <filename>`*
```

---

## 💾 Save Configuration

### 📁 **Where should I save your PRD?**

1. 📂 **Default:** `.taskmaster/docs/prd.md`
2. 🗂️ **Custom:** Enter your own file path

> 💡 *Type 1 or 2, or enter a custom filepath directly*

<wait-for-response:save_location>

<handle-save-location>
if save_location == "1":
    filepath = ".taskmaster/docs/prd.md"
elif save_location == "2":
    prompt: "Enter custom filepath:"
    filepath = {custom_path}
else:
    # User entered a direct filepath
    filepath = save_location
</handle-save-location>

<save-prd>

### 🎯 **Next Steps:**

✅ **PRD saved to:** `{filepath}`

```bash
# 1. Parse PRD into actionable tasks
task-master parse-prd {filepath}

# 2. Analyze and expand tasks
task-master analyze-complexity --research
task-master expand --all --research

# 3. Start building!
task-master next
```

### 🚀 **Ready to transform your vision into tasks!**