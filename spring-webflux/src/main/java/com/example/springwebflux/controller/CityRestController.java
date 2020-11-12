package com.example.springwebflux.controller;

import com.example.springwebflux.entity.City;
import com.example.springwebflux.service.CityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import reactor.core.publisher.Flux;
import reactor.core.publisher.Mono;

import javax.annotation.Resource;

/**
 * 城市 Controller 实现 Restful HTTP 服务
 * <p>
 * Created by bysocket on 09/29/2017.
 */
@RestController
@RequestMapping(value = "/city")
public class CityRestController {

    @Resource
    private CityService cityService;

    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public Mono<City> findOneCity(@PathVariable("id") Long id) {
        return Mono.create(cityMonoSink -> cityMonoSink.success(cityService.findCityById(id)));
    }

    @RequestMapping(method = RequestMethod.GET)
    public Flux<City> findAllCity() {
        return Flux.create(cityFluxSink -> {
            cityService.findAllCity().forEach(cityFluxSink::next);
            cityFluxSink.complete();
        });
    }

    @RequestMapping(method = RequestMethod.POST)
    public Mono<Long> createCity(@RequestBody City city) {
        return Mono.create(cityMonoSink -> cityMonoSink.success(cityService.saveCity(city)));
    }

    @RequestMapping(method = RequestMethod.PUT)
    public Mono<Long> modifyCity(@RequestBody City city) {
        return Mono.create(cityMonoSink -> cityMonoSink.success(cityService.updateCity(city)));
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public Mono<Long> modifyCity(@PathVariable("id") Long id) {
        return Mono.create(cityMonoSink -> cityMonoSink.success(cityService.deleteCity(id)));
    }
}
