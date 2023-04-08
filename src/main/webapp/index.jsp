<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Book Wise</title>
<link
	href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />
<link rel="stylesheet" href="styles.css">
</head>
<body>
	<header class="bg-blue-500 py-4">
		<div class="container mx-auto flex justify-between items-center">
			<h1 class="text-white text-3xl font-semibold">Books</h1>
			<form action="search" method="GET" class="flex items-center">
				<input type="text" name="query" placeholder="Search Books"
					class="rounded-l-lg py-2 px-4 bg-white text-gray-700 leading-tight focus:outline-none mr-2"
					autocomplete="off">
				<button type="submit"
					class="bg-white text-blue-500 py-2 px-4 rounded-r-lg">Search</button>
			</form>
			<a href="allbooks" class="bg-white text-blue-500 py-2 px-4 rounded">Show
				All Books</a>
		</div>
	</header>
</body>
</html>