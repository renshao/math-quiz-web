# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a Daily Math Quiz web application built with ASP.NET Core 9.0 that generates printable A4 sheets of math quizzes for primary school students. The app serves quizzes at https://math.shao.io with support for viewing answers via query parameter `?a=1`.

## Development Commands

### Build and Run
```bash
# Run the application
dotnet run

# Build the project
dotnet build

# Restore dependencies
dotnet restore
```

### Docker
```bash
# Build Docker image
docker build -t math-quiz-web .

# Run with Docker
docker run -p 8080:80 math-quiz-web
```

## Architecture

### Core Components

**Controllers**
- `QuizController`: Main quiz logic, handles quiz display and random quiz generation
- `HomeController`: Landing page controller

**Models**
- `Quiz`: Represents a complete quiz with sections
- `Section`: Groups questions by category (e.g., "Multiplication & Division", "Plus & Minus")
- `Question`: Individual math problem with operands, operation, and answer
- `QuizService`: Static service that loads all quiz data from JSON files at startup
- `QuizType`: Enum defining available quiz types

**Quiz Types**
- `Original`: Classic format with multiplication/division and plus/minus sections
- `OriginalBinHex`: Extended format including binary and hex conversion
- `Summer`, `PlusSingleDigit`, `PlusDoubleDigit`: Specialized quiz types
- `TimesTableFull`, `TimesTableUpToFive`: Multiplication table focused quizzes

### Data Loading

Quiz data is loaded from JSON files in `quiz-questions/` directory at application startup. The `QuizService` static constructor populates a `QuizMap` dictionary that maps quiz types to quiz instances by ID.

### Routing

Custom routes handle quiz URLs:
- `/quiz/{quizType}/random` - Generate random quiz of specified type
- `/quiz/{quizType}/{id}` - Show specific quiz by type and ID
- Query parameter `?a=1` displays answers

### Views

Razor views in `Views/` directory with shared layout. The main quiz display is in `Views/Quiz/Show.cshtml` which renders sections and questions for printing.

## Key Files

- `Program.cs`: Application configuration and routing setup
- `Models/QuizService.cs`: JSON data loading and quiz initialization
- `Controllers/QuizController.cs`: Quiz display logic and random generation
- `quiz-questions/*.json`: Quiz question data files