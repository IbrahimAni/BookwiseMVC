<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<link rel="stylesheet" href="../css/styles.css">

<style type="text/css">
.truncate {
	max-width: 200px; /* You can adjust this value to your desired width */
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}
#alert {
  animation: slide-down 0.5s ease-in-out 0s 1 forwards, slide-up 0.5s ease-in-out 3s 1 forwards;
}

@keyframes slide-down {
  0% {
    transform: translateY(-100%);
  }
  100% {
    transform: translateY(0);
  }
}

@keyframes slide-up {
  0% {
    transform: translateY(0);
  }
  100% {
    transform: translateY(-100%);
  }
}

</style>
</head>
<body>
<div class="fixed top-0 left-0 right-0 z-10" id="alert">
    <div class="bg-green-500 text-white px-4 py-3 shadow-md" role="alert">
      <p class="font-bold">Success!</p>
      <p class="text-sm">The book has been updated.</p>
    </div>
  </div>
<header class="bg-blue-500 py-4">
    <div class="container mx-auto flex justify-between items-center">
      		<a href="">
				<h1 class="text-white text-3xl font-semibold">Books</h1>
			</a>
      <form action="search" method="GET" class="flex items-center">
        <input type="text" name="query" placeholder="Search Books" class="rounded-l-lg py-2 px-4 bg-white text-gray-700 leading-tight focus:outline-none mr-2" autocomplete="off">
        <button type="submit" class="bg-white text-blue-500 py-2 px-4 rounded-r-lg">Search</button>
      </form>
      <a href="add" class="bg-white text-blue-500 py-2 px-4 rounded">Add Book</a>
    </div>
  </header>
	<main class="container mx-auto mt-8">
		<div class="grid grid-cols-2 gap-8">
			<!-- Data Display Section -->
			<div class="data-display-section">
				<div class="bg-white shadow rounded p-4">
					<h2 class="text-xl font-semibold mb-4">Books List</h2>
					<div class="overflow-x-auto">
						<table class="table-auto min-w-max">
							<thead>
								<tr class="text-left font-semibold">
									<th class="border-b p-2">ID</th>
									<th class="border-b p-2">Title</th>
									<th class="border-b p-2">Author</th>
									<th class="border-b p-2">Date</th>
									<th class="border-b p-2">Genres</th>
									<th class="border-b p-2">Characters</th>
									<th class="border-b p-2">Synopsis</th>
									<th class="border-b p-2">Actions</th>
								</tr>
							</thead>
							<tbody>
								<!-- Example of a data record -->
								<c:forEach items="${books}" var="book">
									<tr>
										<td class="border-b p-2 truncate w-16">${book.id }</td>
										<td class="border-b p-2 truncate w-40">${book.title }</td>
										<td class="border-b p-2 truncate w-40">${book.author }</td>
										<td class="border-b p-2 truncate w-32">${book.date }</td>
										<td class="border-b p-2 truncate w-40">${book.genres }</td>
										<td class="border-b p-2 truncate w-40">${book.characters }</td>
										<td class="border-b p-2 truncate w-64">${book.synopsis }</td>
										<td class="border-b p-2">
											<a href="view?id=${book.id.toString()}"
												class="bg-blue-500 text-white py-1 px-3 rounded">View</a>
											<!-- <button class="bg-red-500 text-white py-1 px-3 rounded">Delete</button> -->
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			
			<!-- Book Details Section -->
		            <div class="book-details-section">
                <div class="bg-white shadow rounded p-4">
                    <div class="flex justify-between items-center">
                        <h2 class="text-xl font-semibold mb-4">Book Details</h2>
                        <div>
                            <a href="update?id=${dbook.id.toString()}" class="bg-blue-500 text-white py-1 px-3 rounded">Update</a>
                            <a href="delete?id=${dbook.id.toString()}" class="bg-red-500 text-white py-1 px-3 rounded">Delete</a>
                        </div>
                    </div>
                    <div class="flex flex-wrap">
                        <img src="https://i.ibb.co/tH2rkC8/two-new-books-wrappers.jpg" alt="Book cover" class="w-48 h-72 md:w-64 md:h-96 lg:w-72 lg:h-108 xl:w-80 xl:h-120 mr-4 mb-4">
                        <div>
                            <p><span class="font-bold">Title: </span> ${dbook.title }</p>
                            <p><span class="font-bold">Author: </span>${dbook.author }</p>
                            <p><span class="font-bold">Date: </span> ${dbook.date }</p>
                            <p><span class="font-bold">Genres: </span>${dbook.genres }</p>
                            <p><span class="font-bold">Characters: </span>${dbook.characters }</p>
                            <p><span class="font-bold">Synopsis: </span>${dbook.synopsis }</p>
                        </div>
                    </div>
                </div>
            </div>
		</div>
	</main>
	<script type="text/javascript">
	document.getElementById("alert").style.display = "block";
	</script>
</body>
</html>