# 🤖 AI Integration Setup Guide

This guide will help you set up and configure the Gemini AI integration in your Finance Manager app.

## 📋 Table of Contents

- [Overview](#overview)
- [Getting Your Gemini API Key](#getting-your-gemini-api-key)
- [Configuration](#configuration)
- [Testing the Integration](#testing-the-integration)
- [Features Implemented](#features-implemented)
- [Troubleshooting](#troubleshooting)
- [Architecture](#architecture)

## 🌟 Overview

The Finance Manager app now includes an AI-powered financial assistant using Google's Gemini AI. This assistant can:

- Chat about financial questions
- Categorize expenses automatically
- Generate personalized financial insights
- Provide purchase advice
- Recommend budget allocations
- Detect spending anomalies

## 🔑 Getting Your Gemini API Key

### Step 1: Visit Google AI Studio

1. Go to [https://makersuite.google.com/app/apikey](https://makersuite.google.com/app/apikey)
2. Sign in with your Google account

### Step 2: Create API Key

1. Click **"Create API Key"** button
2. Select an existing Google Cloud project or create a new one
3. Click **"Create API key in new project"** (or select existing project)
4. Copy the generated API key
5. **IMPORTANT**: Store this key securely - you won't be able to see it again!

### Step 3: Enable Billing (Optional but Recommended)

- For production use, enable billing on your Google Cloud project
- Free tier includes:
  - 60 requests per minute
  - 1,500 requests per day
  - 1 million tokens per month

## ⚙️ Configuration

### Step 1: Add Your API Key

Open the file:
```
lib/features/ai/data/datasources/gemini_datasource.dart
```

Find line 13 and replace `YOUR_GEMINI_API_KEY_HERE` with your actual API key:

```dart
static const String _apiKey = 'YOUR_ACTUAL_API_KEY_HERE';
```

**Example:**
```dart
static const String _apiKey = 'AIzaSyBxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx';
```

### Step 2: Verify Dependencies

Ensure `pubspec.yaml` includes:

```yaml
dependencies:
  google_generative_ai: ^0.4.0
```

If not already done, run:
```bash
flutter pub get
```

### Step 3: Run Code Generation

Generate Freezed models and JSON serialization:

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

### Step 4: Build and Run

```bash
# For development
flutter run

# For release
flutter run --release
```

## 🧪 Testing the Integration

### 1. Launch the App

- Build and run the app on your device or emulator
- Sign in with your account

### 2. Navigate to AI Assistant

You can access the AI Assistant in two ways:

**Option A: From Dashboard**
- Go to the Dashboard (Home screen)
- Look for the **"AI Financial Assistant"** card with the 🤖 icon
- Tap the card to open the AI Chat screen

**Option B: Direct Navigation**
- The AI Chat screen is available at route: `/ai-chat`

### 3. Test Basic Chat

Try asking:
- "How can I save more money?"
- "Give me tips to reduce my spending"
- "Analyze my finances"

**Expected Result**: AI should respond with helpful financial advice

### 4. Test Quick Actions

#### Get Insights
1. Tap **"Get Insights"** chip
2. AI will analyze your financial data
3. View generated insights in a dialog

**Note**: Currently uses mock data. See [Connecting Real Data](#connecting-real-data) below.

#### Should I Buy?
1. Tap **"Should I Buy?"** chip
2. Enter item name (e.g., "iPhone 15")
3. Enter price (e.g., "999.99")
4. Tap **"Get Advice"**

**Expected Result**: AI provides purchase recommendation based on your finances

#### Spending Tips
1. Tap **"Spending Tips"** chip
2. AI provides general spending reduction tips

### 5. Test Category Suggestion

1. Send a message like: "Categorize: Coffee at Starbucks"
2. AI should suggest "Food" category

**Expected Result**: AI responds with a category from the predefined list

### 6. Clear Chat

1. Tap the delete icon (trash) in the app bar
2. Confirm deletion
3. Chat history clears

## ✨ Features Implemented

### 1. AI Chat Interface

**Location**: `lib/features/ai/presentation/screens/ai_chat_screen.dart`

**Features**:
- Beautiful Material Design 3 UI
- Real-time chat with AI
- Quick action chips for common tasks
- Empty state with suggestions
- Loading indicators
- Error handling
- Clear chat functionality

### 2. Smart Expense Categorization

**Method**: `categorizeExpense(String description)`

**Categories**: Food, Entertainment, Transport, Shopping, Bills, Healthcare, Education, Utilities, Other

**How it works**:
- AI analyzes expense description
- Returns appropriate category
- Fallback to "Other" if uncertain

### 3. Financial Insights Generation

**Method**: `generateInsights(...)`

**Input**:
- Total income
- Total expenses
- Category breakdown
- Savings rate
- Top spending categories

**Output**:
- 3-5 actionable insights
- Prioritized (High/Medium/Low)
- Typed (Spending/Saving/Budget/Goal/Anomaly/Achievement)

### 4. Purchase Advisor

**Method**: `shouldIBuy(...)`

**Analyzes**:
- Item price vs. income
- Current savings
- Affordability
- Impact on financial goals

**Provides**:
- Clear recommendation (Yes/Maybe/No)
- Reasoning
- Alternative suggestions

### 5. Budget Recommendations

**Method**: `recommendBudget(...)`

**Uses**: 50/30/20 rule
- 50% needs
- 30% wants
- 20% savings

**Output**: Recommended budget by category

### 6. Anomaly Detection

**Method**: `detectAnomaly(...)`

**Detects**:
- Unusual spending patterns
- Significant changes from average
- Potential budget concerns

## 🔧 Troubleshooting

### Issue: "Empty response from AI"

**Possible Causes**:
1. Invalid API key
2. API quota exceeded
3. Network connectivity issues

**Solutions**:
1. Verify API key in `gemini_datasource.dart`
2. Check Google Cloud Console for quota limits
3. Ensure device has internet connection
4. Check API key is enabled for Generative Language API

### Issue: "Failed to chat with AI: Exception..."

**Possible Causes**:
1. Malformed API request
2. API service unavailable
3. Rate limiting

**Solutions**:
1. Check error message details
2. Wait a few minutes and retry
3. Verify API key permissions in Google Cloud Console

### Issue: Build errors after code generation

**Solutions**:
```bash
# Clean build
flutter clean

# Get dependencies
flutter pub get

# Run code generation again
flutter pub run build_runner build --delete-conflicting-outputs

# If still failing, delete generated files manually
find . -name "*.g.dart" -delete
find . -name "*.freezed.dart" -delete

# Then run build_runner again
flutter pub run build_runner build --delete-conflicting-outputs
```

### Issue: "Unused import" warnings

**This is normal!** These warnings appear before the first build. They'll disappear after running the app once.

### Issue: AI responses are slow

**This is normal** for the free tier. Responses typically take 2-5 seconds.

**Optimization tips**:
- Keep prompts concise
- Avoid unnecessary context
- Consider upgrading to paid tier for faster responses

### Issue: Cannot see AI Assistant card on Dashboard

**Solutions**:
1. Ensure you're signed in
2. Restart the app
3. Check that dashboard screen was updated correctly
4. Look for the card between Balance Card and Quick Stats

## 🏗️ Architecture

### Clean Architecture Structure

```
lib/features/ai/
├── data/
│   ├── datasources/
│   │   └── gemini_datasource.dart          # Gemini API integration
│   ├── models/                              # (Future: for data models)
│   └── repositories/
│       └── ai_repository_impl.dart          # Repository implementation
├── domain/
│   ├── entities/
│   │   ├── ai_message.dart                  # Chat message entity
│   │   └── financial_insight.dart           # Insight entity
│   ├── repositories/
│   │   └── ai_repository.dart               # Repository interface
│   └── usecases/                            # (Future: use cases)
└── presentation/
    ├── bloc/
    │   ├── ai_chat_bloc.dart                # BLoC logic
    │   ├── ai_chat_event.dart               # Events
    │   └── ai_chat_state.dart               # States
    ├── screens/
    │   └── ai_chat_screen.dart              # Main chat UI
    └── widgets/
        ├── chat_bubble.dart                 # Message bubble
        ├── insight_card.dart                # Insight display
        └── quick_action_chip.dart           # Action chips
```

### Data Flow

```
User Input
    ↓
AIChatBloc (Event)
    ↓
AIRepository
    ↓
GeminiDatasource (API Call)
    ↓
Google Gemini AI
    ↓
Response
    ↓
AIRepository (Either<Error, Success>)
    ↓
AIChatBloc (State)
    ↓
UI Update
```

### Dependency Injection

All AI components are registered in `service_locator.dart`:

```dart
// Datasource
getIt.registerLazySingleton<GeminiDatasource>(() => GeminiDatasource());

// Repository
getIt.registerLazySingleton<AIRepository>(
  () => AIRepositoryImpl(getIt<GeminiDatasource>()),
);

// BLoC
getIt.registerFactory<AIChatBloc>(
  () => AIChatBloc(getIt<AIRepository>()),
);
```

## 🔗 Connecting Real Data

Currently, the AI features use mock data for demonstrations. To connect real user data:

### 1. Update AI Chat BLoC

In `lib/features/ai/presentation/bloc/ai_chat_bloc.dart`:

**Line 423** - Add financial context:
```dart
void _sendMessage(BuildContext context, String message) {
  // Get actual user data
  final transactionBloc = context.read<TransactionBloc>();
  final incomeBloc = context.read<IncomeBloc>();
  final budgetBloc = context.read<BudgetBloc>();

  // Build context string
  final context = '''
User Financial Summary:
- Monthly Income: \$${_calculateIncome(incomeBloc.state)}
- Monthly Expenses: \$${_calculateExpenses(transactionBloc.state)}
- Current Savings Rate: ${_calculateSavingsRate(...)}%
''';

  context.read<AIChatBloc>().add(
    AIChatEvent.sendMessage(message, context: context),
  );
  _messageController.clear();
}
```

### 2. Update Purchase Advisor

Replace mock values on lines 518-520 with:

```dart
userIncome: _getActualMonthlyIncome(context),
userExpenses: _getActualMonthlyExpenses(context),
userSavings: _getActualSavings(context),
```

### 3. Update Insights Generation

Replace mock values on lines 538-549 with actual repository data:

```dart
final transactionState = context.read<TransactionBloc>().state;
final incomeState = context.read<IncomeBloc>().state;

// Calculate from actual data
final totalIncome = _calculateTotalIncome(incomeState);
final totalExpenses = _calculateTotalExpenses(transactionState);
// etc...
```

## 📊 API Usage Limits

### Free Tier

| Limit | Value |
|-------|-------|
| Requests per minute | 60 |
| Requests per day | 1,500 |
| Tokens per month | 1,000,000 |

### Monitoring Usage

1. Go to [Google Cloud Console](https://console.cloud.google.com)
2. Navigate to "APIs & Services" → "Dashboard"
3. Select "Generative Language API"
4. View usage statistics

## 🔐 Security Best Practices

### DO NOT:
- ❌ Commit API keys to version control
- ❌ Share API keys publicly
- ❌ Use production keys in development
- ❌ Store keys in client-side code for production apps

### DO:
- ✅ Use environment variables for API keys
- ✅ Implement backend proxy for API calls in production
- ✅ Rotate API keys regularly
- ✅ Monitor API usage for anomalies
- ✅ Set up budget alerts in Google Cloud Console

### Production Setup (Recommended)

For production apps, **do not store API keys in the client app**. Instead:

1. Create a backend service (Firebase Functions, etc.)
2. Store API key securely on backend
3. Client app calls your backend
4. Backend forwards requests to Gemini AI
5. Backend returns responses to client

Example architecture:
```
Flutter App → Your Backend API → Gemini AI
              (API key stored here)
```

## ✅ Integration Checklist

Use this checklist to verify successful integration:

- [ ] `pubspec.yaml` updated with `google_generative_ai: ^0.4.0`
- [ ] All AI feature files created in `lib/features/ai/`
- [ ] Freezed models generated successfully (`.freezed.dart` files exist)
- [ ] Service locator updated with AI registrations
- [ ] App router updated with `/ai-chat` route
- [ ] Dashboard shows AI Assistant card
- [ ] Gemini API key added to `gemini_datasource.dart`
- [ ] App builds without errors
- [ ] Can navigate to AI chat screen from dashboard
- [ ] Can send messages and receive responses (after adding API key)
- [ ] Quick actions ("Get Insights", "Should I Buy?", "Spending Tips") work
- [ ] Purchase advisor dialog opens and submits
- [ ] Chat history can be cleared
- [ ] Error states display properly
- [ ] Loading indicators show while AI is processing

## 📝 Code Generation Commands

For reference, here are the commands you'll use:

```bash
# Install dependencies
flutter pub get

# Generate code (Freezed + JSON)
flutter pub run build_runner build --delete-conflicting-outputs

# Watch for changes (development)
flutter pub run build_runner watch

# Clean generated files
flutter pub run build_runner clean

# Run app
flutter run

# Run in release mode
flutter run --release
```

## 🎨 Customization

### Changing AI Model Parameters

In `gemini_datasource.dart` (lines 21-26):

```dart
generationConfig: GenerationConfig(
  temperature: 0.7,        // Creativity (0.0-1.0)
  topK: 40,               // Token selection diversity
  topP: 0.95,             // Cumulative probability
  maxOutputTokens: 1024,  // Max response length
),
```

**Temperature**:
- Lower (0.0-0.3): More focused, deterministic
- Medium (0.4-0.7): Balanced
- Higher (0.8-1.0): More creative, varied

### Customizing Safety Settings

Adjust safety thresholds in `gemini_datasource.dart` (lines 27-32).

### Adding Custom Prompts

Add new methods to `GeminiDatasource` for custom AI interactions:

```dart
Future<String> customAdvice(String query) async {
  final prompt = '''You are a financial advisor.

  User query: $query

  Provide helpful advice.''';

  final content = [Content.text(prompt)];
  final response = await _model.generateContent(content);
  return response.text ?? 'No response';
}
```

## 🚀 Next Steps

1. **Add API Key**: Get your Gemini API key and add it to the datasource
2. **Test Features**: Try all quick actions and chat functionality
3. **Connect Real Data**: Replace mock data with actual user financial data
4. **Enhance Prompts**: Customize AI prompts for better responses
5. **Add Features**: Implement additional AI-powered features:
   - Recurring transaction detection
   - Bill reminders
   - Financial goal tracking
   - Investment advice
   - Debt payoff strategies

## 📚 Additional Resources

- [Google AI Studio](https://makersuite.google.com/)
- [Gemini API Documentation](https://ai.google.dev/docs)
- [Flutter BLoC Documentation](https://bloclibrary.dev/)
- [Freezed Package](https://pub.dev/packages/freezed)
- [Clean Architecture in Flutter](https://resocoder.com/flutter-clean-architecture-tdd/)

## 🆘 Getting Help

If you encounter issues:

1. Check this troubleshooting guide
2. Review error messages carefully
3. Check Gemini API status: [https://status.cloud.google.com/](https://status.cloud.google.com/)
4. Review your Google Cloud Console for API errors
5. Check Flutter version compatibility

## 📄 License

This AI integration follows the same license as the main Finance Manager app (MIT License).

---

**Built with ❤️ using Google Gemini AI and Flutter**

*Last Updated: 2025-01-23*
