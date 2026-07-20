# MiBank - Fintech Wallet Concept

I built this project to practice mixing multiple layout and navigation systems together into a single, seamless flow. 

### 📱 Check out the app in action:


https://github.com/user-attachments/assets/89010351-75ed-4392-b571-564ca2d09b4f



### 🛠️ What I built & learned:
* **The Master Swipe Controller (`PageView`):** Instead of using sharp page jumps, I hooked up a PageView to let users swipe smoothly between the Onboarding screen, Dashboard, and Checkout form. 
* **State Callbacks:** To make the "Get Started" button on the first screen actually move the pages, I learned how to pass the PageController down as a reference so the child screen can talk back to the parent layout.
* **Fixing Layout Crashes:** Dealt with those annoying "unbounded height" layout crashes while nesting a vertical transactions list inside a scrollable column. Solved it by mastering shrink-wrap boundaries and locking gesture physics.
* **Custom Dialogs & Pickers:** Built an asynchronous custom receipt popup that catches data from the native date/time pickers and maps string values onto the confirmation card.
