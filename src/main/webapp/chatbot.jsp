<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Chatbot</title>
<style>
body {
	font-family: Arial, sans-serif;
	background: linear-gradient(to bottom, #263238, #8f94fb);
	margin: 0;
	padding: 0;
	display: flex;
	justify-content: center;
	align-items: center;
	min-height: 100vh;
}

.container {
	width: 500px;
	padding: 20px;
	background-color: #fff;
	border-radius: 10px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
}

.chat-container {
	border: 1px solid #ccc;
	padding: 10px;
	background-color: #f2f2f2;
	border-radius: 10px;
	overflow-y: scroll;
	max-height: 300px;
}

.chat-message {
	margin: 10px;
	padding: 15px;
	background-color: #e2e2e2;
	border-radius: 10px;
}

.input-container {
	display: flex;
	margin-top: 20px; /* Add some spacing between input and chat */
}

.input-container input[type="text"] {
	flex-grow: 1;
	padding: 10px;
	border: none;
	border-radius: 5px;
	margin-right: 10px;
	font-size: 16px; /* Increase input font size */
}

.input-container button {
	background: linear-gradient(to bottom, #007BFF, #0056b3);
	/* Gradient button background */
	color: #fff;
	border: none;
	border-radius: 5px;
	padding: 12px 24px; /* Increase button padding */
	cursor: pointer;
	font-size: 16px; /* Increase button font size */
}
</style>
</head>
<body>
	<div class="container">
		<h1 style="text-align: center;">Chatbot</h1>
		<div class="chat-container" id="chat-container">
			<!-- Chat messages will be displayed here -->
		</div>
		<div class="input-container">
			<input type="text" id="user-input"
				placeholder="Type your question...">
			<button id="send-button">Send</button>
		</div>
	</div>
	<script>
        const chatContainer = document.getElementById('chat-container');
        const userInputElement = document.getElementById('user-input');
        const sendButton = document.getElementById('send-button');

        // Define your predefined questions and answers
        const questionsAndAnswers = {
        		 "What are some essential programming books for beginners?": "Some great programming books for beginners include 'Learn Python the Hard Way' and 'JavaScript: The Good Parts.'",
        		  "Can you recommend advanced programming books for experienced developers?": "For experienced developers, 'Clean Code: A Handbook of Agile Software Craftsmanship' and 'Design Patterns: Elements of Reusable Object-Oriented Software' are highly recommended.",
        		  "What's a good book for learning data structures and algorithms?": "'Introduction to Algorithms' by Cormen, Leiserson, Rivest, and Stein is a classic choice.",
        		  "Suggest a book for learning web development.": "'Eloquent JavaScript' is a popular book for learning web development.",
        		  "Which books cover machine learning and artificial intelligence?": "'Hands-On Machine Learning with Scikit-Learn, Keras, and TensorFlow' and 'Artificial Intelligence: A Modern Approach' are excellent choices.",
        		  "Can you recommend a book for learning mobile app development?": "'Mobile App Development with React Native' is a great book for mobile app development.",
        		  "What's a good book for learning SQL and database management?": "'SQL for Dummies' and 'Learning SQL' are beginner-friendly options.",
        		  "Recommend a book on software testing.": "'The Art of Software Testing' by Glenford J. Myers is a classic book on software testing.",
        		  "What's a good book for mastering version control with Git?": "'Pro Git' by Scott Chacon and Ben Straub is a comprehensive guide to Git.",
        		  "Suggest a book on DevOps practices.": "'The Phoenix Project: A Novel About IT, DevOps, and Helping Your Business Win' is a popular book on DevOps.",
        		  "What are some books on cybersecurity?": "'Hacking: The Art of Exploitation' and 'The Web Application Hacker's Handbook' are great resources for cybersecurity enthusiasts.",
        		  "Recommend a book on software architecture.": "'Software Architecture in Practice' by Len Bass, Paul Clements, and Rick Kazman is a recommended read.",
        		  "What's a good book for learning cloud computing?": "'AWS Certified Solutions Architect - Associate 2021' is a comprehensive resource for Amazon Web Services.",
        		  "Can you suggest a book on data science?": "'Python for Data Analysis' and 'Data Science for Business' are excellent choices for data science enthusiasts.",
        		  "What books cover full-stack development?": "'Full-Stack React, TypeScript, and Node' and 'Full Stack Development with Spring Boot and React' are great options.",
        		  "Recommend a book on software project management.": "'Scrum: The Art of Doing Twice the Work in Half the Time' is a popular book on Scrum and Agile project management.",
        		  "Suggest a book on game development.": "'Unity in Action: Multiplatform Game Development in C#' is a valuable resource for game developers.",
        		  "What books can help me prepare for coding interviews?": "'Cracking the Coding Interview' and 'Elements of Programming Interviews' are essential for interview preparation.",
        		  "Can you recommend a book on blockchain technology?": "'Mastering Bitcoin' by Andreas M. Antonopoulos is a well-regarded book on blockchain.",
        		  "Suggest a book for learning Kotlin programming.": "'Kotlin in Action' is an excellent book for learning Kotlin.",
        		  "What are some good books for learning Python for data science?": "'Python for Data Science Handbook' and 'Python Data Science Handbook' are comprehensive resources.",
        		  "Recommend a book for mastering front-end development with React.": "'React Up and Running' is a good choice for mastering React.",
        		  "What's a good book for learning C++ programming?": "'Accelerated C++' is a book often recommended for learning C++.",
        		  "Suggest a book on programming best practices.": "'Code Complete: A Practical Handbook of Software Construction' is a classic book on programming best practices.",
        		  "Can you recommend a book on software engineering principles?": "'The Mythical Man-Month: Essays on Software Engineering' by Frederick P. Brooks Jr. is a seminal work in software engineering.",
        		  "What are some books for learning Rust programming?": "'Programming Rust' and 'The Rust Programming Language' are great for learning Rust.",
        		  "Suggest a book on functional programming.": "'Functional Programming in Scala' and 'Functional Programming in JavaScript' are recommended.",
        		  "What's a good book for learning Docker and containerization?": "'Docker Deep Dive' and 'Docker in Action' are great for mastering Docker.",
        		  "Recommend a book on microservices architecture.": "'Microservices Patterns: With examples in Java' is a comprehensive guide to microservices.",
        		  "Suggest a book for learning Android app development.": "'Android Programming: The Big Nerd Ranch Guide' is a popular choice for Android app development.",
        		  "What books cover the principles of agile software development?": "'Agile Estimating and Planning' and 'Agile Principles, Patterns, and Practices in C#' are recommended for agile development.",
        		  "Can you recommend a book on user interface (UI) design?": "'Don't Make Me Think' by Steve Krug is a classic book on UI/UX design.",
        		  "What's a good book for learning game design?": "'The Art of Game Design: A Book of Lenses' by Jesse Schell is a popular book on game design.",
        		  "Suggest a book on software quality assurance.": "'Software Testing' by Ron Patton is a comprehensive guide to software testing.",
        		  "Recommend a book on agile project management.": "'Agile Project Management with Scrum' is a valuable resource for agile project managers.",
        		  "What are some books on software architecture patterns?": "'Software Architecture Patterns' and 'Pattern-Oriented Software Architecture' are good choices.",
        		  "Can you suggest a book for learning Ruby programming?": "'The Well-Grounded Rubyist' is a recommended book for Ruby programming.",
        			  "what is java?": "Java is a high-level, object-oriented programming language.",
        			  "What is the main feature of Java that makes it platform-independent?": "Java's bytecode and JVM (Java Virtual Machine) make it platform-independent.",
        			  "How do you declare a variable in Java?": "You declare a variable in Java using the syntax: datatype variableName;",
        			  "What is a constructor in Java?": "A constructor is a special method used for initializing objects in Java.",
        			  "Explain the difference between an abstract class and an interface in Java.": "An abstract class can have both abstract and concrete methods, while an interface can only have abstract methods.",
        			  "What is the purpose of the 'static' keyword in Java?": "'static' is used to create class-level variables and methods that are not tied to a specific instance of the class.",
        			  "How do you handle exceptions in Java?": "Exceptions are handled using try-catch blocks or by declaring exceptions in the method signature.",
        			  "What is the difference between '==' and '.equals()' in Java?": "'==' compares object references, while '.equals()' compares the contents of objects.",
        			  "What is method overloading in Java?": "Method overloading allows you to define multiple methods with the same name but different parameters in a class.",
        			  "How do you create and start a new thread in Java?": "You can create a new thread by extending the Thread class or implementing the Runnable interface."
        };

        sendButton.addEventListener('click', () => {
            const userQuestion = userInputElement.value.trim();
            if (userQuestion !== "") {
                // Display user's question
                appendMessage(userQuestion, true);

                // Look for an answer in the predefined questions and answers
                const answer = questionsAndAnswers[userQuestion];
                if (answer) {
                    // Display the answer
                    appendMessage(answer, false);
                } else {
                    // Display a default response if the question is not found
                    appendMessage("I'm sorry, I don't have an answer to that question.", false);
                }

                // Clear the input field
                userInputElement.value = "";
            }
        });

        function appendMessage(message, isUser) {
            const messageElement = document.createElement('div');
            messageElement.classList.add('chat-message');
            if (isUser) {
                messageElement.classList.add('user-message');
            }
            messageElement.textContent = message;
            chatContainer.appendChild(messageElement);

            // Scroll to the bottom of the chat container
            chatContainer.scrollTop = chatContainer.scrollHeight;
        }
    </script>
</body>
</html>
