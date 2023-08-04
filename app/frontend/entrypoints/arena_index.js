var champion_1_id = document.querySelector('select[name="champion_1_id"]');
var champion_2_id = document.querySelector('select[name="champion_2_id"]');

var champion_1_weapon_1_id = document.querySelector('select[name="champion_1_weapon_1_id"]');
var champion_1_weapon_2_id = document.querySelector('select[name="champion_1_weapon_2_id"]');
var champion_2_weapon_1_id = document.querySelector('select[name="champion_2_weapon_1_id"]');
var champion_2_weapon_2_id = document.querySelector('select[name="champion_2_weapon_2_id"]');

var fight_stats_div = document.querySelector("div#fight_stats");

const fight_button = document.querySelector('#start_fight');

champion_1_weapon_1_id.addEventListener("change", function(){
  var w = $(champion_1_weapon_1_id).find(':selected').data('weight');
  if(w == 1){
    champion_1_weapon_2_id.disabled = false;
  } else {
    champion_1_weapon_2_id.selectedIndex = 0;
    champion_1_weapon_2_id.disabled = true;
  }
});

champion_2_weapon_1_id.addEventListener("change", function(){
  var w = $(champion_2_weapon_1_id).find(':selected').data('weight');
  if(w == 1){
    champion_2_weapon_2_id.disabled = false;
  } else {
    champion_2_weapon_2_id.selectedIndex = 0;
    champion_2_weapon_2_id.disabled = true;
  }
});

fight_button.addEventListener("click", function(){
  let url = '/arena/fight?';
  url += `champion_1_id=${champion_1_id.value}&`
  url += `champion_2_id=${champion_2_id.value}&`
  
  if(champion_1_weapon_1_id.value != 0)
    url += `champion_1_weapon_1_id=${champion_1_weapon_1_id.value}&`
  
  if(champion_1_weapon_2_id.value != 0)
    url += `champion_1_weapon_2_id=${champion_1_weapon_2_id.value}&`
  
  if(champion_2_weapon_1_id.value != 0)
    url += `champion_2_weapon_1_id=${champion_2_weapon_1_id.value}&`
  
  if(champion_2_weapon_2_id.value != 0)
    url += `champion_2_weapon_2_id=${champion_2_weapon_2_id.value}`

  $.ajax({
    type: "GET",
    url: url,
    success: function (data){
      var champions = data.champions;
      
      const newTitleDiv = document.createElement("div");
      newTitleDiv.innerText = `Résumé de l'affrontement entre ${champions[0].name} et ${champions[1].name} :`
      const starterDiv = document.createElement("div");
      starterDiv.innerText = `- ${champions[data.first - 1].name} a gagné uniquement parce qu'il a eu de la chance et a attaqué en premier...`
      const numberTurnsDiv = document.createElement("div");
      numberTurnsDiv.innerText = `- Et le combat a tout de même duré ${data.turns.length} tours`

      fight_stats_div.appendChild(newTitleDiv);
      fight_stats_div.appendChild(starterDiv);
      fight_stats_div.appendChild(numberTurnsDiv);
      console.log(data);

    }
  });
});
