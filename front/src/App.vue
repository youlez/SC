<template>
  <div class="m-4">
    <div
      class="modal fade"
      id="crear_conductor"
      tabindex="-1"
      aria-labelledby="crear_conductorLabel"
      aria-hidden="true"
    >
      <div class="modal-dialog">
        <form @submit.prevent="guardarConductor" class="modal-content">
          <div class="modal-header">
            <h1 class="modal-title fs-5" id="crear_conductorLabel">
              {{ titulo }} Conductor
            </h1>
            <button
              type="button"
              class="btn-close"
              data-bs-dismiss="modal"
              aria-label="Close"
            ></button>
          </div>
          <div class="modal-body">
            <div class="row">
              <div class="col-12 mb-3">
                <label class="required form-label"
                  ><b>Identificación:</b></label
                >
                <input
                  class="form-control"
                  v-model="formData.identificacion"
                  type="text"
                  required
                />
              </div>
              <div class="col-12 mb-3">
                <label class="required form-label"><b>Nombre:</b></label>
                <input
                  class="form-control"
                  v-model="formData.nombre"
                  type="text"
                  required
                />
              </div>
              <div class="col-12 mb-3">
                <label class="required form-label"><b>Apellido:</b></label>
                <input
                  class="form-control"
                  v-model="formData.apellido"
                  type="text"
                  required
                />
              </div>
              <div class="col-12 mb-3">
                <label class="required form-label"><b>Telefono:</b></label>
                <input
                  class="form-control"
                  v-model="formData.telefono"
                  type="number"
                  required
                />
              </div>
              <div class="col-12 mb-3">
                <label class="required form-label"><b>Dirección:</b></label>
                <input
                  class="form-control"
                  v-model="formData.direccion"
                  type="text"
                  required
                />
              </div>
            </div>
          </div>
          <div class="modal-footer">
            <button
              type="button"
              class="btn btn-secondary"
              data-bs-dismiss="modal"
            >
              Cerrar
            </button>
            <button type="submit" class="btn btn-primary">Guardar</button>
          </div>
        </form>
      </div>
    </div>
    <div
      class="modal fade"
      id="vehiculos_asociados"
      tabindex="-1"
      aria-labelledby="vehiculos_asociadosLabel"
      aria-hidden="true"
    >
      <div class="modal-dialog modal-lg">
        <div class="modal-content">
          <div class="modal-header">
            <h1 class="modal-title fs-5" id="vehiculos_asociadosLabel">
              Vehiculos
            </h1>
            <button
              type="button"
              class="btn-close"
              data-bs-dismiss="modal"
              aria-label="Close"
            ></button>
          </div>
          <div class="modal-body">
            <table class="table">
              <thead class="table-dark">
                <tr>
                  <th>Placa</th>
                  <th>Modelo</th>
                  <th>Capacidad</th>
                  <th>Opciones</th>
                </tr>
              </thead>
              <tbody>
                <tr
                  v-for="(vehiculo, index) in vehiculos_asociados"
                  v-bind:key="index"
                  :id="index"
                >
                  <td>
                    {{ vehiculo.placa }}
                  </td>
                  <td>
                    {{ vehiculo.modelo }}
                  </td>
                  <td>
                    {{ vehiculo.capacidad }}
                  </td>
                  <td>
                    <button
                      type="button"
                      class="btn btn-danger"
                      @click="asociarVehiculo(vehiculo.id_vehiculo, null)"
                    >
                      Desasociar
                    </button>
                  </td>
                </tr>
              </tbody>
            </table>
            <div class="card">
              <div class="card-header">
                <h6>Asociar Vehiculo</h6>
              </div>
              <form
                class="card-body row"
                @submit.prevent="
                  asociarVehiculo(vehiculo_asociar, conductor_seleccionado)
                "
              >
                <div class="col-12 mb-3">
                  <label class="required form-label"><b>Vehículo:</b></label>
                  <select
                    v-model="vehiculo_asociar"
                    class="form-select"
                    aria-label="Vehículo"
                  >
                    <option v-bind:value="null">Seleccione una opcion</option>
                    <option
                      v-for="(option, index) in options_vehiculo"
                      v-bind:key="index"
                      :id="index"
                      v-bind:value="option.id_vehiculo"
                    >
                      {{ option.placa }}
                    </option>
                  </select>
                </div>
                <div class="mx-auto">
                  <button type="submit" class="btn btn-success">Asociar</button>
                </div>
              </form>
            </div>
          </div>
          <div class="modal-footer">
            <button
              type="button"
              class="btn btn-secondary"
              data-bs-dismiss="modal"
            >
              Cerrar
            </button>
          </div>
        </div>
      </div>
    </div>
    <div
      class="modal fade"
      id="crear_vehiculo"
      tabindex="-1"
      aria-labelledby="crear_vehiculoLabel"
      aria-hidden="true"
    >
      <div class="modal-dialog">
        <form @submit.prevent="guardarVehiculo" class="modal-content">
          <div class="modal-header">
            <h1 class="modal-title fs-5" id="crear_vehiculoLabel">
              {{ titulo }} Vehiculo
            </h1>
            <button
              type="button"
              class="btn-close"
              data-bs-dismiss="modal"
              aria-label="Close"
            ></button>
          </div>
          <div class="modal-body">
            <div class="row">
              <div class="col-12 mb-3">
                <label class="required form-label"><b>Placa:</b></label>
                <input
                  class="form-control"
                  v-model="formVehiculo.placa"
                  type="text"
                  required
                />
              </div>
              <div class="col-12 mb-3">
                <label class="required form-label"><b>Modelo:</b></label>
                <input
                  class="form-control"
                  v-model="formVehiculo.modelo"
                  type="text"
                  required
                />
              </div>
              <div class="col-12 mb-3">
                <label class="required form-label"><b>Capacidad:</b></label>
                <input
                  class="form-control"
                  v-model="formVehiculo.capacidad"
                  type="text"
                  required
                />
              </div>
            </div>
          </div>
          <div class="modal-footer">
            <button
              type="button"
              class="btn btn-secondary"
              data-bs-dismiss="modal"
            >
              Cerrar
            </button>
            <button type="submit" class="btn btn-primary">Guardar</button>
          </div>
        </form>
      </div>
    </div>
    <div class="card shadow">
      <div class="row">
        <ul class="nav flex-column nav nav-pills p-4 col-lg-3">
          <li class="nav-item mb-2">
            <a
              class="nav-link active"
              data-bs-toggle="tab"
              data-bs-target="#conductores"
              type="button"
              role="tab"
              aria-controls="conductores"
              aria-selected="true"
              >Conductores</a
            >
          </li>
          <li class="nav-item">
            <a
              class="nav-link"
              data-bs-toggle="tab"
              data-bs-target="#vehiculos"
              type="button"
              role="tab"
              aria-controls="vehiculos"
              aria-selected="false"
              >Vehiculos</a
            >
          </li>
        </ul>
        <div class="tab-content p-4 col-lg-9">
          <div
            class="tab-pane fade show active"
            id="conductores"
            role="tabpanel"
            aria-labelledby="conductores"
            tabindex="0"
          >
            <h1>Conductores</h1>
            <button
              type="button"
              class="btn btn-info my-2"
              data-bs-toggle="modal"
              data-bs-target="#crear_conductor"
              @click="
                titulo = 'Crear';
                limpiarConductor();
              "
            >
              Crear
            </button>
            <table class="table">
              <thead class="table-dark">
                <tr>
                  <th>Identificación</th>
                  <th>Nombre</th>
                  <th>Apellido</th>
                  <th>Telefono</th>
                  <th>Direccion</th>
                  <th>Opciones</th>
                </tr>
              </thead>
              <tbody>
                <tr
                  v-for="(conductor, index) in conductores"
                  v-bind:key="index"
                  :id="index"
                >
                  <td>
                    {{ conductor.identificacion }}
                  </td>
                  <td>
                    {{ conductor.nombre }}
                  </td>
                  <td>
                    {{ conductor.apellido }}
                  </td>
                  <td>
                    {{ conductor.telefono }}
                  </td>
                  <td>
                    {{ conductor.direccion }}
                  </td>
                  <td>
                    <button
                      type="button"
                      class="btn btn-success"
                      data-bs-toggle="modal"
                      data-bs-target="#vehiculos_asociados"
                      @click="
                        conductor_seleccionado = conductor.id_conductor;
                        vehiculo_asociar = null;
                        getVehiculosAsociados(conductor.id_conductor);
                      "
                    >
                      Vehiculos
                    </button>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
          <div
            class="tab-pane fade"
            id="vehiculos"
            role="tabpanel"
            aria-labelledby="vehiculos"
            tabindex="0"
          >
            <h1>Vehículos</h1>
            <button
              type="button"
              class="btn btn-info my-2"
              data-bs-toggle="modal"
              data-bs-target="#crear_vehiculo"
              @click="
                titulo = 'Crear';
                limpiarVehiculos();
              "
            >
              Crear
            </button>
            <table class="table">
              <thead class="table-dark">
                <tr>
                  <th>Placa</th>
                  <th>Modelo</th>
                  <th>Capacidad</th>
                  <th>Conductor</th>
                </tr>
              </thead>
              <tbody>
                <tr
                  v-for="(vehiculos, index) in vehiculos"
                  v-bind:key="index"
                  :id="index"
                >
                  <td>
                    {{ vehiculos.placa }}
                  </td>
                  <td>
                    {{ vehiculos.modelo }}
                  </td>
                  <td>
                    {{ vehiculos.capacidad }}
                  </td>
                  <td>
                    {{
                      vehiculos.conductor == null
                        ? "Sin Asignar"
                        : vehiculos.conductor.nombre +
                          " " +
                          vehiculos.conductor.apellido
                    }}
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import axios from "axios";
import Swal from "sweetalert2";
export default {
  data() {
    return {
      formData: {
        identificacion: null,
        nombre: null,
        apellido: null,
        telefono: null,
        direccion: null,
      },
      formVehiculo: {
        placa: null,
        modelo: null,
        capacidad: null,
      },
      conductores: [],
      titulo: null,
      vehiculos_asociados: [],
      conductor_seleccionado: null,
      vehiculo_asociar: null,
      options_vehiculo: [],
      vehiculos: [],
    };
  },
  mounted() {
    this.getConductores();
    this.getVehiculos();
    this.getVehiculosAsociados(null);
  },
  methods: {
    getConductores() {
      axios
        .get("http://127.0.0.1:8000/SC/conductores")
        .then((response) => {
          this.conductores = response.data;
        })
        .catch((error) => {
          console.log(error);
        });
    },
    limpiarConductor() {
      this.formData.identificacion = null;
      this.formData.nombre = null;
      this.formData.apellido = null;
      this.formData.telefono = null;
      this.formData.direccion = null;
    },
    guardarConductor() {
      axios
        .post("http://127.0.0.1:8000/SC/guardarConductor", {
          formData: JSON.stringify(this.formData),
        })
        .then((response) => {
          Swal.fire(
            "Conductor Guardado",
            "El conductor se ha guardado correctamente.",
            "success"
          ).then((result) => {
            this.getConductores();
            this.limpiarConductor();
          });
        })
        .catch((error) => {
          Swal.fire("Error", "No se pudo guardar la información", "error");
          console.log(error);
        });
    },
    getVehiculosAsociados(id_conductor) {
      this.vehiculos_asociados = [];
      axios
        .get("http://127.0.0.1:8000/SC/vehiculosAsociados/" + id_conductor)
        .then((response) => {
          if (id_conductor == null) {
            this.options_vehiculo = response.data;
          } else {
            this.vehiculos_asociados = response.data;
          }
        })
        .catch((error) => {
          console.log(error);
        });
    },
    asociarVehiculo(id_vehiculo, id_conductor) {
      axios
        .post("http://127.0.0.1:8000/SC/asociarConductor", {
          id_vehiculo: id_vehiculo,
          id_conductor: id_conductor,
        })
        .then((response) => {
          var accion;
          if (id_conductor == null) {
            accion = "desasociado";
          } else {
            accion = "asociado";
          }
          Swal.fire(
            "Exito",
            "El vehiculo se ha " + accion + " correctamente.",
            "success"
          ).then((result) => {
            this.getVehiculosAsociados(this.conductor_seleccionado);
            this.getVehiculos();
            this.getVehiculosAsociados(null);
            this.vehiculo_asociar = null;
          });
        })
        .catch((error) => {
          Swal.fire("Error", "No se pudo modificar la información", "error");
          console.log(error);
        });
    },
    getVehiculosSinAsociar() {
      this.conductor_seleccionado = id_conductor;
      this.vehiculos_asociados = [];
      axios
        .get(
          "http://127.0.0.1:8000/SC/vehiculosAsociados/" +
            this.conductor_seleccionado
        )
        .then((response) => {
          this.vehiculos_asociados = response.data;
        })
        .catch((error) => {
          console.log(error);
        });
    },
    getVehiculos() {
      axios
        .get("http://127.0.0.1:8000/SC/vehiculos")
        .then((response) => {
          this.vehiculos = response.data;
        })
        .catch((error) => {
          console.log(error);
        });
    },
    limpiarVehiculos() {
      this.formVehiculo.placa = null;
      this.formVehiculo.modelo = null;
      this.formVehiculo.capacidad = null;
    },
    guardarVehiculo() {
      axios
        .post("http://127.0.0.1:8000/SC/guardarVehiculo", {
          formData: JSON.stringify(this.formVehiculo),
        })
        .then((response) => {
          Swal.fire(
            "Vehiculo Guardado",
            "El vehiculo se ha guardado correctamente.",
            "success"
          ).then((result) => {
            this.getVehiculos();
            this.limpiarVehiculos();
          });
        })
        .catch((error) => {
          Swal.fire("Error", "No se pudo guardar la información", "error");
          console.log(error);
        });
    },
  },
};
</script>
<style>
.required:after {
  content: " *";
  color: red;
}
</style>
