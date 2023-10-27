import '../../../index.dart';

class MovieSource {
  Future<List<Movie>> getFreeLimitedTimeVideos() {
    return Future.delayed(const Duration(seconds: 10)).then((value) {
      return demoVideos();
    });
  }

  Future<List<Movie>> getLatestVideos() {
    return Future.delayed(const Duration(seconds: 15)).then((value) {
      return demoVideos();
    });
  }

  Future<List<Movie>> getMostWatchedVideos() {
    return Future.delayed(const Duration(seconds: 10)).then((value) {
      return demoVideos();
    });
  }

  Future<List<Movie>> getPremiumVideos() {
    return Future.delayed(const Duration(seconds: 15)).then((value) {
      return demoVideos();
    });
  }

  Future<List<Movie>> getRecentWatchVideos() {
    return Future.delayed(const Duration(seconds: 5)).then((value) {
      return demoVideos();
    });
  }

  Future<List<Movie>> getShortVideos() {
    return Future.delayed(const Duration(seconds: 15)).then((value) {
      return demoVideos();
    });
  }

  Future<List<Movie>> getSpecificHeroVideos(String heroName) {
    return Future.delayed(const Duration(seconds: 10)).then((value) {
      return demoVideos();
    });
  }

  Future<List<Movie>> getTrailers() {
    return Future.delayed(const Duration(seconds: 15)).then((value) {
      return demoVideos();
    });
  }

  static List<Movie> demoVideos(){
    return [
      Movie(
        name: "BANGLADESH 12K HDR 120fps Dolby Vision with Calming Music",
        description: "You can use this High Resolution Video Footage on your TV at Living Room, Office, Lounge, Waiting Room, Spa, Showroom, Restaurant and more. Play It On Your LG OLed TV, Samsung QLed TV, Smart TV, Sony Device, Samsung Technology, Roku, Apple TV, IPad Pro, Apple XDR, Chromecast, Xbox, Playstation, Wii and more.",
        thumbnail: DemoPhotoUrls.img1,
        videoUrl: "https://www.youtube.com/watch?v=yVYQeDhAQWk",
      ),
      Movie(
        name: "China 4K Scenic -Pemandangan Negara China",
        description: "China merupakan negara terluas di Asia timur. Berdasarkan letak astronomisnya. China terletak antara 18° LU-54° LU dan 73° BT-135° BT. Luas wilayah China adalah 9.696.960 kilometer persegi.  Secara geografis China terletak di kawasan timur dan berhadapan dengan Samudra Pasifik. Negara China berbentuk republik. China memiliki posisi yang strategis dibandingkan dengan negara lain. Hal ini karena letaknya berada di tengah-tengah negara ataupun benua yang membuat China memiliki perbatasan dengan akses secara langsung ke negara tetangga, bahkan antarbenua. dan cina mempuyain pemandangan yang memukau dan lembah2 yang sangat indah salamt menikmati",
        thumbnail: DemoPhotoUrls.img2,
        videoUrl: "https://www.youtube.com/watch?v=vPzC20eaCiU",
      ),
      Movie(
        name: "2K HDR 60fps Dolby Vision | Crystal Black",
        description: "No description found!",
        thumbnail: DemoPhotoUrls.img3,
        videoUrl: "https://www.youtube.com/watch?v=3XD22mnrcsc",
      ),
      Movie(
        name: "Freedom",
        thumbnail: DemoPhotoUrls.img4,
        videoUrl: "https://www.youtube.com/watch?v=yVYQeDhAQWk",
      ),
      Movie(
        name: "The Dark",
        thumbnail: DemoPhotoUrls.img5,
        videoUrl: "https://www.youtube.com/watch?v=yVYQeDhAQWk",
      ),
      Movie(
        name: "Switzerland 8K ULTRA HD HDR - Heaven of Earth (60 FPS)",
        description: "No description found!",
        thumbnail: DemoPhotoUrls.img6,
        videoUrl: "https://www.youtube.com/watch?v=yVYQeDhAQWk",
      ),
      Movie(
        name: "Mountains (Full Episode) | Hostile Planet",
        description: "The highest mountains on Earth are home to snow leopards, golden eagles, mountain goats, barnacle goslings and gelada monkeys. But only the toughest can endure the extreme weather, scarce food and limited oxygen on these peaks. Using new technology to showcase never-before-filmed animal behavior, Hostile Planet provides unique access to one of the most extreme environments on the planet.",
        thumbnail: DemoPhotoUrls.img7,
        videoUrl: "https://www.youtube.com/watch?v=NcRifDitRnU",
      ),
      Movie(
        name: "African Safari 4K - Scenic Wildlife Film With African Music",
        description: "There are very few experiences that compare to the adventure of an African Safari. Enjoy this 4k Scenic Wildlife film to witness the magic of a Safari in Africa. From lions in the Serengeti, to hippos in the Okavango Delta, African Safaris are full of the world’s most incredible wildlife. What is your favorite Safari animal?",
        thumbnail: DemoPhotoUrls.img8,
        videoUrl: "https://www.youtube.com/watch?v=P8frC_cLLD4",
      ),
      Movie(
        name: "The Ocean 4K - Scenic Wildlife Film With Calming Music",
        description: "The Ocean is one of the most incredible places on earth. Enjoy this 4K Scenic Wildlife Film featuring the diverse animals and scenery of the ocean. From vibrant coral reefs, to majestic dolphins, the Ocean is a fascinating place. What is your favorite animal in the Ocean?",
        thumbnail: DemoPhotoUrls.img9,
        videoUrl: "https://www.youtube.com/watch?v=eoTpdTU8nTA",
      ),
      Movie(
        name: "Animals of Europe 4K - Scenic Wildlife Film With Calming Music",
        description: "Europe is home to some of the world's most incredible animals. Enjoy this 4K Scenic Wildlife film featuring the majestic wildlife of Europe. From Polar Bears in the Arctic, to Ibex goats in the Alps, Europe's animals are truly magical. What is your favorite European animal?",
        thumbnail: DemoPhotoUrls.img10,
        videoUrl: "https://www.youtube.com/watch?v=-0F7iua-37Y",
      ),
    ];
  }
}
