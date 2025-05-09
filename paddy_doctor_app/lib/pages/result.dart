import 'dart:io';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final String prediction;
  final double confidence;
  final File imageFile;

  const ResultPage({
    super.key,
    required this.prediction,
    required this.confidence,
    required this.imageFile,
  });

  // 🔹 Disease Tips Data (Properly Formatted)
  static final Map<String, List<String>> diseaseTips = {

    "bacterial_leaf_streak": [
      "Causes",
      "• Caused by Xanthomonas oryzae pv. oryzicola.",
      "• Bacteria spread through infected seeds, irrigation water, wind-driven rain, and plant debris.",
      "• High humidity, warm temperatures (25-30°C), and frequent rain favor disease spread.",
      "• Insects, mechanical injuries, or farming tools create openings for bacterial entry.",

      "Prevention",
      "• Use certified disease-free seeds.",
      "• Treat seeds with hot water (52°C for 30 min) or bactericides before sowing.",
      "• Remove and burn infected plant residues.",
      "• Rotate crops to break bacterial cycles.",
      "• Avoid excessive nitrogen fertilizers (as they increase susceptibility).",
      "• Ensure proper drainage to prevent waterlogging.",
      "• Use disease-resistant or tolerant rice varieties (consult local agricultural experts).",
      "• Apply copper-based fungicides or streptomycin under expert guidance.",
      "• Use biocontrol agents like Pseudomonas fluorescens to suppress bacterial growth.",

      "Organic Control",
      "• Garlic extract (natural antibacterial).",
      "• Rice straw compost (improves microbial balance).",
      "• Bamboo vinegar solution (acts as a microbial agent).",

      "Biochemical Control",
      "• Copper hydroxide 53.8% WP (2g/liter).",
      "• Kasugamycin 2% SL (2 ml/liter).",
      "• Bordeaux mixture (1%).",
    ],


    "bacterial_leaf_blight": [ 
         "Causes",
     "• Bacterial leaf blight of rice (BB) is caused by the Gram-negative bacterium Xanthomonas oryzae pv.",
     "• The bacterium survives in diseased stem tissue (cankers), plant debris, and soil.",
     "• It can be spread by insects, pruning tools, wind, and rain.",
   
     "Prevention",
     "• Seed treatment with bleaching powder (100g/l) and zinc sulfate (2%) reduces bacterial blight.",
     "• Seed treatment: Soak seeds for 8 hours in Agrimycin (0.025%) and wettable ceresan (0.05%), followed by hot water treatment for 30 min at 52-54°C.",
     "• Seed soaking for 8 hours in ceresan (0.1%) and treatment with Streptocyclin (3g in 1 liter).",
     "• Spray neem oil 3% or NSKE 5%.",
     "• Spray fresh cow dung extract for bacterial blight control. Dissolve 20g of cow dung in 1 liter of water, allow it to settle, and sieve. Use the supernatant liquid starting from the initial appearance of the disease and repeat at fortnightly intervals.",
   
     "Organic Control",
     "• Neem oil spray (5 ml/liter of water).",
     "• Cow dung extract (fermented in water for 24 hours).",
     "• Pseudomonas fluorescens bio-control agent.",
   
     "Biochemical Control",
     "• Copper oxychloride (COC) 50 WP (2.5g/liter).",
     "• Streptomycin sulfate + Tetracycline (300 ppm).",
     "• Kasugamycin (Kasumin) 2 ml/liter."
    ],

    "bacterial_panicle_blight": [
      "Causes",
      "• Bacterial panicle blight is seed-transmitted.",
      "• Disease spread is temperature-dependent, developing during hot, dry weather at later plant growth stages.",
      "• Prevalence increases when daytime temperatures exceed 32°C and night temperatures remain around 25°C or above.",
      "• High nitrogen levels favor disease development.",
      "• Rice planted earlier in the spring tends to have less damage due to cooler temperatures at heading and grain filling.",

      "Preventive Measures",
      "• Clean fields thoroughly by removing plant residues from the previous harvest.",
      "• Plant only certified, disease-free seeds.",
      "• Choose a rice variety with partial resistance if available.",
      "• Plant the crop earlier in the spring.",
      "• Control fertilization and avoid excessive nitrogen application.",
      "• Avoid overwatering.",
      "• Monitor the crop regularly and check for sick plants.",
      "• Consider crop rotation with non-host crops like legumes.",

      "Organic Control",
      "• Rice husk ash extract (antimicrobial properties).",
      "• Bacillus subtilis bio-fungicide.",
      "• Seaweed extract spray.",

      "Biochemical Control",
      "• Copper hydroxide 53.8% WP (3g/liter).",
      "• Oxolinic Acid (0.5 g/liter).",
      "• Tetracycline (250 ppm).",
    ],

    "black_stem_borer": [
  "Causes",
  "• Pest attack Tiny beetles (Aproceros leucopoda or Batocera rufomaculata) bore into rice stems.",
  "• High humidity & temperature Favorable conditions for infestation.",
  "• Weak plants Drought, poor nutrition, or disease increase vulnerability.",
  "• Monocropping - Continuous rice cultivation attracts pests.",
  "• Poor field hygiene - Infested plant debris harbors borers.",

  "Prevention",
  "• Avoid leaving large amounts of deadwood on the ground after windstorms or ice storms, as these attract pests.",
  "• During harvesting, prevent damage to residual trees to maintain tree health and limit bark beetle populations.",
  "• Remove felled trees immediately to reduce borer infestation.",
  "• Harvesting or pruning trees in fall or winter minimizes bark beetle attacks.",
  "• Wet storage of logs, rapid felling and hauling, piling logs in dry, sunny locations, and chemical treatments help control the black stem borer.",

  "Organic Control",
  "• Neem seed kernel extract (NSKE) 5%.",
  "• Trichogramma japonicum (egg parasitoid).",
  "• Castor oil spray.",

  "Biochemical Control",
  "• Chlorantraniliprole 0.4% GR (apply in early infestation).",
  "• Emamectin benzoate 5 SG (0.4g/liter).",
  "• Fipronil 5 SC (2 ml/liter)."
],

    "blast": [
      "Causes", // 🔹 Heading (No bullet)
      "• It occurs in areas with low soil moisture, frequent and prolonged periods of rain showers, and cool daytime temperatures.",
      "• In upland rice, large day-night temperature differences that cause dew formation on leaves and cooler temperatures favor disease development.",

      "Prevention",
      "• Avoid dry nurseries.",
      "• Avoid late planting.",
      "• Burning of straw and stubbles after harvest.",
      "• Avoid grasses and other weeds on bunds and inside.",
      "• Dry seed treatment with Pseudomonas fluorescens talc formulation @10g/kg of seed.",
      "• Stagnate water to a depth of 2.5cm over an area of 25m² in the nursery. Sprinkle 2.5 kg of P. fluorescens (talc) and mix with stagnated water. Soak the root system of seedlings for 30 min and transplant.",
      "• Spray P. fluorescens talc formulation @ 0.5% from 45 days after transplanting at 10-day intervals, three times.",

      "Organic Control",
      "• Neem leaf decoction spray.",
      "• Trichoderma harzianum bio-fungicide.",
      "• Buttermilk spray (fermented cow milk).",

      "Biochemical Control",
      "• Carbendazim 50% WP (1g/liter).",
      "• Tricyclazole 75% WP (0.6g/liter).",
      "• Azoxystrobin 23% SC (1ml/liter).",
    ],
    
    "brown_spot": [
      "Causes",
      "• Caused by the fungus Bipolaris oryzae.",
      "• Nutrient deficiency, particularly lack of potassium or nitrogen, weakens plants.",
      "• Drought stress increases disease severity.",
      "• Poor seed quality leads to disease spread.",
      "• High humidity and temperatures (25-30°C) favor fungal growth.",

      "Prevention",
      "• Treat seeds before sowing to prevent infection.",
      "• Choose resistant rice varieties.",
      "• Use slow-releasing nitrogen fertilizers.",
      "• Keep farmland free from weeds and debris to control disease spread.",

      "Organic Control",
      "• Neem oil spray.",
      "• Wood ash dusting.",
      "• Cow urine + fermented jaggery solution.",

      "Biochemical Control",
      "• Mancozeb 75 WP (2.5 g/liter).",
      "• Propiconazole 25 EC (1 ml/liter).",
      "• Copper oxychloride 50 WP (3g/liter).",
    ],
    
"downy_mildew": [
      "Causes",
      "• Moderate temperatures combined with high moisture favor pathogen multiplication and plant infection.",
      "• Most common in spring and early summer under humid conditions.",
      "• Recognized by yellow-mottled leaf patterns and white fungal-like growth on leaf undersides.",
      "• Caused by various oomycete pathogens, including Pseudoperonospora, Peronospora, and Plasmopara.",
      "• Each pathogen has distinct host preferences and genetic traits.",

      "Prevention",
      "• Grow resistant crop varieties.",
      "• Implement crop rotation to break the disease cycle.",
      "• Avoid consecutive plantings of susceptible crops.",
      "• Monitor fields regularly to detect early signs of infection.",

      "Organic Control",
      "• Garlic + onion extract spray.",
      "• Trichoderma viride bio-fungicide.",
      "• Aloe vera extract spray.",

      "Biochemical Control",
      "• Metalaxyl 8% + Mancozeb 64% WP (2g/liter).",
      "• Copper hydroxide 53.8% WP (2g/liter).",
      "• Fosetyl-Al 80 WP (1.5 g/liter).",
    ],

"hispa": [
      "Causes",
      "• Pest attack by Dicladispa armigera beetles, which feed on rice leaves, causing skeletonization.",
      "• Warm, moist conditions with high humidity and temperature favor infestation.",
      "• Continuous rice cultivation (monocropping) increases pest survival and spread.",
      "• Poor field hygiene, including the presence of ratoons, wild grasses, and weeds, provides breeding grounds.",
      "• Overuse of nitrogen fertilizer makes rice plants more vulnerable.",

      "Prevention",
      "• Remove and destroy rice ratoons, wild grasses, and weeds during the crop-free season to reduce pest survival and migration.",
      "• Grow rice early in the season and avoid excessive nitrogen fertilizer during high pest incidence.",
      "• Clip and destroy infested leaf tips (removes 75-92% grubs). Use sweeping nets in the morning to collect and destroy adult beetles.",
      "• No resistant varieties exist, but BR25 and BR7 are less susceptible.",
      "• Introduce Eulophus femoralis parasitoid from Indonesia for larval control. Conservation of local natural enemies is essential.",

      "Organic Control",
      "• Neem oil 5% spray.",
      "• Handpicking of infected leaves.",
      "• Use of light traps at night.",

      "Biochemical Control",
      "• Chlorantraniliprole 18.5 SC (0.4 ml/liter).",
      "• Fipronil 5 SC (2 ml/liter).",
      "• Quinalphos 25 EC (1.5 ml/liter).",
    ],

    "leaf_roller": [
  "Causes",
  "• Damage is caused by the feeding activity of the larvae of the cotton leaf roller, Syllepte derogata.",
  "• Adult moths are medium-sized with a wingspan of 25-30 mm, yellowish-white in color, with black and brown spots on the head and thorax.",
  "• Dark-brown wavy lines on both wings form conspicuous patterns.",
  "• Females lay eggs on the underside of younger leaves at the top of the plant.",
  "• Young larvae initially feed on the underside of leaves before moving to the upper side to form rolled-leaf cocoons where they pupate.",
  "• Larvae grow up to 15 mm long and have a dirty pale green, semi-translucent color.",

  "Prevention",
  "• Plant resistant varieties if Syllepte derogata is a recurring problem.",
  "• Plant later in the season to avoid population peaks.",
  "• Grow healthy plants with a good fertilization program.",
  "• Regularly inspect plants or fields for signs of disease or pests.",
  "• Handpick leaves infested with eggs, rolled leaves, and caterpillars.",
  "• Use traps to attract moths.",
  "• Avoid indiscriminate insecticide use that destroys natural enemies of the pest.",
  "• Remove or destroy infested plants and plant waste by burning them.",

  "Organic Control",
  "• Neem seed kernel extract (NSKE) 5%.",
  "• Trichogramma japonicum parasitoid release.",
  "• Sticky yellow traps in the field.",

  "Biochemical Control",
  "• Chlorantraniliprole 18.5 SC (0.4 ml/liter).",
  "• Flubendiamide 20 WG (0.5 g/liter).",
  "• Fipronil 5 SC (2 ml/liter)."
],
"tungro": [
      "Causes",
      "• Viral infection caused by Rice Tungro Bacilliform Virus (RTBV) and Rice Tungro Spherical Virus (RTSV).",
      "• Spread by Green Leafhoppers (Nephotettix virescens & N. nigropictus).",
      "• Virus survives in weeds and infected rice plants.",
      "• Continuous rice cultivation provides a habitat for leafhoppers and the virus.",
      "• Unsynchronized planting increases the risk of infection across fields.",

      "Prevention",
      "• Use resistant varieties like IR64 and IR72.",
      "• Control Green Leafhoppers using insecticides (Imidacloprid, Thiamethoxam) and neem oil.",
      "• Uproot and destroy infected plants to prevent spread.",
      "• Maintain field sanitation by removing weeds (Leersia, Echinochloa) that host the virus.",
      "• Practice synchronized planting to disrupt the vector life cycle.",
      "• Avoid overlapping crops to reduce continuous breeding of leafhoppers.",

      "Organic Control",
      "• Planting resistant varieties (IR64, TKM6, etc.).",
      "• Intercropping with marigold to repel vector insects.",
      "• Neem oil 5% spray.",

      "Biochemical Control",
      "• Imidacloprid 17.8 SL (0.2 ml/liter).",
      "• Thiamethoxam 25 WG (0.3g/liter).",
      "• Carbofuran 3G (3kg/acre).",
    ],

    "white_stem_sorer": [
  "Causes",
  "• Pest attack by moth larvae that bore into rice stems.",
  "• High humidity & temperatures (25-30°C) favor infestation.",
  "• Late planting increases vulnerability.",
  "• Continuous rice cultivation allows pests to persist.",

  "Prevention & Control",
  "• Use resistant varieties (consult local agricultural experts).",
  "• Synchronize planting to break pest cycles.",
  "• Remove and destroy infected plants.",
  "• Apply light traps & pheromone traps to control moths.",
  "• Use insecticides (Cartap Hydrochloride, Chlorantraniliprole) if needed.",

  "Organic Control",
  "• Neem cake application in soil.",
  "• Light traps for adult moths.",
  "• Egg parasitoid Trichogramma japonicum release.",

  "Biochemical Control",
  "• Cartap Hydrochloride 50 SP (1g/liter).",
  "• Chlorantraniliprole 0.4% GR (4kg/acre).",
  "• Fipronil 0.3% GR (4kg/acre)."
],
"yellow_stem_borer": [
      "Causes",
      "• Moth larvae bore into rice stems, causing 'dead heart' and 'white ear'.",
      "• High humidity, cloudy weather, and excess nitrogen fertilizers increase risk.",
      "• Continuous cropping and presence of infected plant debris facilitate infestation.",

      "Prevention & Control",
      "• Grow early-maturing, resistant rice varieties.",
      "• Use pheromone traps to capture adult moths.",
      "• Apply biocontrol agents like Trichogramma japonicum (egg parasitoid).",
      "• Remove and destroy infested plants.",
      "• Use insecticides (Fipronil, Chlorantraniliprole) if infestation is severe.",

      "Organic Control",
      "• Intercropping with onion or garlic.",
      "• Neem oil + soap spray.",
      "• Light traps at night.",

      "Biochemical Control",
      "• Cartap Hydrochloride 4G (10kg/acre).",
      "• Chlorantraniliprole 18.5 SC (0.4 ml/liter).",
      "• Fipronil 5 SC (2 ml/liter).",
    ],

    "normal": [
  "Tips to Boost Yield",
  "• Use high-quality, certified seeds of high-yielding varieties.",
  "• Ensure proper land preparation with adequate plowing and leveling.",
  "• Follow optimal planting time to maximize growth conditions.",
  "• Maintain appropriate plant spacing for better air circulation and nutrient absorption.",
  "• Practice crop rotation to improve soil health and reduce pest buildup.",
  "• Implement water management techniques like alternate wetting and drying.",
  "• Apply organic matter like compost or farmyard manure to enrich soil fertility.",
  "• Conduct regular field inspections to monitor plant health and growth.",
  "• Control weeds efficiently through manual removal or mulching.",
  "• Harvest at the right maturity stage to ensure maximum grain quality and yield.",

  "Organic Boosters",
  "• Vermicompost application for soil enrichment.",
  "• Azospirillum and Phosphobacteria biofertilizers for nutrient uptake.",
  "• Neem cake application for pest resistance and soil health.",
  "• Green manure (e.g., Sesbania) incorporation for improved nitrogen levels.",
  "• Fish amino acid spray for plant growth stimulation.",
  "• Panchagavya (fermented cow-based solution) for overall plant vigor.",

  "Biochemical Boosters",
  "• Urea (1% foliar spray) for nitrogen boost.",
  "• Potassium nitrate (1g/liter) for better flowering and grain filling.",
  "• Zinc sulfate (0.5g/liter) to prevent zinc deficiency.",
  "• Boron (0.2% solution) for enhanced grain setting.",
  "• Humic acid (3ml/liter) to improve nutrient absorption.",
  "• Gibberellic acid (GA3) spray (10 ppm) for better plant growth."
],

  };

  @override
  Widget build(BuildContext context) {
    final tips = diseaseTips[prediction] ?? ["No tips available for this disease."];

    return Scaffold(
      appBar: AppBar(title: const Text("Prediction Result")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔹 Display Image
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Image.file(
                  imageFile,
                  width: MediaQuery.of(context).size.width * 1.3,
                  height: MediaQuery.of(context).size.height * 0.4,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 20),

            // 🔹 Display Prediction
            Text(
              "DETECTED Paddy Disease: $prediction",
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 10),

            // 🔹 Display Confidence Score
            Text(
              "Confidence: ${(confidence * 100).toStringAsFixed(2)}%",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.blueAccent,
              ),
            ),
            const SizedBox(height: 20),

            // 🔹 Display Tips Section
            const Text(
              "Prevention & Control Tips",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 10),

            // 🔹 Disease Tips List
            for (var tip in tips)
              tip == "Causes" || tip == "Prevention" || tip == "Organic Control" || tip == "Biochemical Control"
                  ? Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Text(
                        tip, // Keep it as text but make it bold
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.only(left: 16, top: 4),
                      child: Text(
                        tip,
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.black54,
                        ),
                      ),
                    ),
          ],
        ),
      ),
    );
  }
}
