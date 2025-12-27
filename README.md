## Dependencies Used & Why

The following key packages were used to meet the specific UI and functional requirements of the test task:

- **`get`**:
    - **Purpose**: Used for reactive state management (managing `Rx` variables like `selectedDate`, `moodValue`) and Dependency Injection (`Get.put`).
    - **Why**: It allows for cleaner separation of logic (Controllers) from UI (Views) and dramatically reduces boilerplate code compared to `Provider` or `Bloc` for a task of this size.

- **`sleek_circular_slider`**:
    - **Purpose**: Implements the interactive mood dial in the Mood Screen.
    - **Why**: The design required a complex circular progress interaction. This package provided a highly customizable base that was further enhanced with gradient overlays and custom inner widgets.

- **`table_calendar`**:
    - **Purpose**: Powers the weekly strip view in Home and the monthly view in the Bottom Sheet selector.
    - **Why**: It is the industry standard for Flutter calendars, offering robust "week mode" support and easy customization of header/day styles to match the dark theme.

- **`flutter_svg`**:
    - **Purpose**: Renders the SVG assets (icons) used throughout the app.
    - **Why**: Ensures high-quality, resolution-independent vector graphics for the UI icons (e.g., navigation icons, workout types).

- **`intl`**:
    - **Purpose**: Handles date formatting.
    - **Why**: Essential for dynamically formatting dates (e.g., "Mon", "Dec 22") and localization-safe transformations.