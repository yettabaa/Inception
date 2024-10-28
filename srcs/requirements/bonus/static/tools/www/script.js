document.getElementById('greetButton').addEventListener('click', () => {
    const message = `
        <strong>Believe in Yourself</strong><br><br>
        Life can be challenging, but remember this: everything is possible if you believe in yourself. Every great achievement started as a dream, and every successful person faced obstacles along the way.<br><br>
        When you encounter setbacks, view them as opportunities to learn and grow. Persistence is key. Many who succeeded did so not because they never failed, but because they never gave up.<br><br>
        Set your goals, take small steps every day, and surround yourself with positivity. Celebrate your progress and embrace the journey.<br><br>
        You have the strength to overcome challenges and achieve your dreams. Keep pushing forward, and never doubt your potential!
    `;

    document.getElementById('greetingMessage').innerHTML = message;
});
